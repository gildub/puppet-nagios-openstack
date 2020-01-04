# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----

# ---- original file header ----
#
# @summary
#   Returns hostgroups matching a provided list of services
#
Puppet::Functions.create_function(:'hostgroups_by_services') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end


  def default_impl(*args)
    
    result = []
    raise Puppet::ParseError, "Cannot handle empty hostgroups!" unless args[0]
    hostgroups = args[0]
    args[1].split(',').each { |service|
      hostgroups.each do |hostgroup, values|
        if values.has_key?('notes')
          result << hostgroup if values['notes'].include?(service)
        end
      end
    }
    result.flatten.uniq.join(',')
  
  end
end
