ReturnValue = require 'nanocyte-component-return-value'

class NotEqual extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = NotEqual
