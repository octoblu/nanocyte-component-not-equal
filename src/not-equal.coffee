ReturnValue = require 'nanocyte-component-return-value'
sameType    = require 'same-type'

class NotEqual extends ReturnValue
  onEnvelope: (envelope) =>
    {config,message} = envelope
    {left,right} = config

    [typedLeft, typedRight] = sameType [left, right]
    return message if typedLeft != typedRight

module.exports = NotEqual
