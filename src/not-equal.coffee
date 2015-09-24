ReturnValue = require 'nanocyte-component-return-value'
moment      = require 'moment'
_           = require 'lodash'

class NotEqual extends ReturnValue
  areEqualDates: (a,b) =>
    moment(a).milliseconds() == moment(b).milliseconds()

  areEqualNumbers: (a,b) =>
    parseFloat(a) == parseFloat(b)

  isDate: (value) =>
    moment(value).isValid()

  isNumeric: (value) =>
    return false if _.isNaN parseFloat value
    return (value - parseFloat(value) + 1) >= 0

  parseDate: (date) =>
    moment(date).valueOf()

  parseNumber: (number) =>
    parseFloat number

  sameType: (items...) =>
    return _.map(items, @parseNumber) if _.all items, @isNumeric
    return _.map(items, @parseDate)   if _.all items, @isDate
    return items

  onEnvelope: (envelope) =>
    {config,message} = envelope
    {left,right} = config

    typedThings = @sameType left, right
    return message unless 1 == _.size _.uniq typedThings

module.exports = NotEqual
