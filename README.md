Description
===========
ruby-sysaid is a Ruby-based wrapper for the SysAid SOAP API. It helps abstract
the nonsense that is dealing with SOAP on Ruby and provides a clean interface
for dealing with SysAid objects.

Usage
=====
    # Required
    SysAid.server_settings = {
      :endpoint => "sysaid.server.com",
      :account => "account",
      :username => "username",
      :password => "password"
    }
    
    # find_by_* any field valid for SysAid
    ticket = service.find_by_id(45)
    ticket = service.find_by_responsibility("somebody")
    ticket = service.find_by_status(3)
    
    # Example of modifying a ticket
    ticket.title = "Updated"
    ticket.save
    
    # Deleting a ticket
    ticket.delete
    
    # Creating a new ticket
    ticket = SysAid::Ticket.new
    ticket.title = "New ticket"
    ticket.assignedTo = "somebody"
    ticket.save
    puts ticket.id   # the ID of the new ticket

Installation
============
(Tested with Ruby 1.9.x)

    gem build ./sysaid.gemspec
    gem install ./sysaid-*.gem

(You may have to specify the specific version above, i.e. sysaid-0.1.0.gem.)

Then, to use it in your scripts, merely:

    require 'sysaid'

Rails Integration
=================
If you'd like to use this gem with Rails, here is one way to do it:

1. Create config/sysaid.yml with the following contents:

          sysaid:
            endpoint: https://sysaid-server
            account: account
            username: username
            password: password

2. Create config/initializers/sysaid.rb with the following contents:

        begin
          sysaid_settings = YAML.load_file("#{Rails.root.to_s}/config/sysaid.yml")['sysaid']
  
          SysAid.server_settings = {
            :endpoint => sysaid_settings['endpoint'],
            :account => sysaid_settings['account'],
            :username => sysaid_settings['username'],
            :password => sysaid_settings['password']
          }
  
          SYSAID_SUPPORT = true
  
          # Place any needed constants here, like the SysAid status table.
          SYSAID_STATUS_NEW = 1
          SYSAID_STATUS_CLOSED = 3
        rescue Errno::ENOENT => e
          logger.warn "config/sysaid.yml is missing. Disabling SysAid support."
          SYSAID_SUPPORT = false
        end

3. Then, anywhere in your Rails application, you can use the gem:

        ticket = SysAid.find_by_id(params[:id])

Additional
==========
If you'd like to debug the SOAP messages being sent back and forth, add
this (optional) setting:

    SysAid.server_settings[:debug] = STDERR

The Ruby SOAP driver was generated by a fork of soap4r from https://github.com/mumboe/soap4r.

The WSDL file used was from SysAid v8.1.

Please file any bugs at https://github.com/cthielen/ruby-sysaid/issues.

Written by Christopher Thielen for the University of California Davis.

Available under the MIT license.

Version 0.1.1
Last updated: Wednesday, June 13, 2012
