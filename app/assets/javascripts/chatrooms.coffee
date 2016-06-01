# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', () ->
  submitNewMsg()
  return

submitNewMsg = ->
  $('textarea#message_content').keydown (ev) ->
    if ev.keyCode is 13
      $('[data-send="message"]').click()
      $('[data-textarea="message"]').val(" ")
      return false
