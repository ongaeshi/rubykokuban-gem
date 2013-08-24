# -*- coding: utf-8 -*-
require 'rubygems'
require 'archive/zip'

module Rubybasic
  module Utils
    module_function

    class ZipfileNotFound < RuntimeError ; end    

    def zip_extract(filename, dst_dir, options)
      raise ZipfileNotFound unless File.exist?(filename)
      
      root_list = root_entrylist(filename)
      
      if (root_list.size == 1)
        # Extract as it is
        Archive::Zip.extract filename, dst_dir
        return root_list[0].gsub("/", "")
      else
        # Extract by creating a directory
        if options[:no_dir]
          Archive::Zip.extract filename, dst_dir
          dst_dir
        else
          dir = File.basename(filename).sub(/#{File.extname(filename)}$/, "")
          FileUtils.mkdir_p File.join(dst_dir, dir)
          Archive::Zip.extract filename, File.join(dst_dir, dir)
          dir
        end
      end
    end

    def root_entrylist(filename)
      list = []
      
      Archive::Zip.open(filename) do |archive|
        archive.each do |entry|
          list << entry.zip_path if entry.zip_path.split('/').size == 1
        end
      end

      list
    end    
  end
end
