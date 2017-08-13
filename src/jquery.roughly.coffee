###!
# Roughly
# https://github.com/dahjson/roughly
# Copyright (c) Daniel Johnson
###

(($) -> # avoid conflicts with $

  class Roughly

    constructor: (@element, options) ->

      # get input field options
      @startDate = @element.data('start-date') ? options.startDate
      @startCount = @element.data('start-count') ? options.startCount
      @waitSeconds = @element.data('wait-seconds') ? options.waitSeconds
      @increaseBy = @element.data('increase-by') ? options.increaseBy
      @decimals = @element.data('decimals') ? options.decimals
      @prefix = @element.data('prefix') ? options.prefix
      @postfix = @element.data('postfix') ? options.postfix

      # convert strings to numbers
      @startCount = parseFloat(@removeCommas(@startCount))
      @waitSeconds = parseFloat(@removeCommas(@waitSeconds))
      @increaseBy = parseFloat(@removeCommas(@increaseBy))
      @decimals = parseFloat(@removeCommas(@decimals))

      # calculate and set starting number
      date = Math.round(new Date(@startDate).getTime() / 1000)
      today = Math.round(new Date().getTime() / 1000)
      @startCount += Math.round((today - date) / @waitSeconds)
      @setCounter()

      # set repeating interval
      setInterval(@updateCounter, @waitSeconds * 1000)

    # update counter
    updateCounter: => # fat arrow needed for closure of @ within setInterval
      @startCount += @increaseBy
      @setCounter()

    # set counter
    setCounter: ->
      @element.text(@prefix + @addCommas(@startCount.toFixed(@decimals)) + @postfix)

    # add commas to number
    addCommas: (num) ->
      num.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")

    # remove commas from number
    removeCommas: (num) ->
      num.toString().replace(/,/g, '')

  # jQuery plugin
  $.fn.roughly = (options) ->

    # default options for plugin
    defaults =
      startDate: 'January 1, 1970', # unix timestamp start date
      startCount: 0,
      waitSeconds: 1,
      increaseBy: 1,
      decimals: 0,
      prefix: '',
      postfix: ''

    # merge defaults with user defaults and options
    settings = $.extend({}, defaults, $.fn.roughly.defaults, options)

    # instantiate class instance
    new Roughly($(this), settings)

  # execute code
  $ ->
    # attach to elements with class name
    $('.roughly').each ->
      $(this).roughly()

) @jQuery
