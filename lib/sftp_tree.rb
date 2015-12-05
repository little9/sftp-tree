require_relative "./sftp_tree/version"
require "net/sftp"

module SftpTree
  def self.get_tree(host, username, password, path, name=nil)
    
    data = {:text =>(name || path)}
    data[:children] = children = []
    
    Net::SFTP.start(host, username, :password => password) do |sftp|

      sftp.dir.foreach(path) do |entry|
        next if (entry.name == '..' || entry.name == '.')

        if entry.longname.start_with?('d')
          children << self.get_tree(host,username,password, path + entry.name + '/')
        end

        if !entry.longname.start_with?('d')
          children << entry.name
        end
      end
    end
    
    return data
    
  end

  def self.get_core_tree(host, username, password, path)
    data = self.get_tree(host,username,password,path)
    root_data = { :data => data }
    return root_data
  end
  
end
