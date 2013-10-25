require 'yaml'
class Loader
  def initialize
    @pluginsDirectories = self.listplugins
    @pluginsInfos       = self.getInfos
  end

  def listplugins
    pluginsDirectories = Array.new

    Dir['plugins/*/'].each { |directory|
      pluginsDirectories.push(directory)
    }
    return pluginsDirectories
  end

  def getInfos
    pluginsInfos = Array.new

    @pluginsDirectories.each { |directory|
      pluginsInfos.push(YAML.load_file(directory + 'plugin.yml'))
    }
    return pluginsInfos
  end

  def getTriggers
    pluginsTriggers = Array.new

    pluginsInfos.each { |plugin|
      pluginsTriggers.push(plugin["triggers"])
    }
    return pluginsTriggers
  end
end