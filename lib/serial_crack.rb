require 'serial_crack/cracker'
require 'serial_crack/version'

module SerialCrack
  module Backends
    autoload :Range, 'serial_crack/backends/range'
    autoload :Wordlist, 'serial_crack/backends/range'
  end
end
