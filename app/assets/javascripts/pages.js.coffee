# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  if $('.loginBackground').length > 0
    $(document).bind 'touchmove', (e) -> e.preventDefault()
