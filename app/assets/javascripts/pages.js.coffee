# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

preview = ->
  converter = new Showdown.converter()
  $('#preview').html(converter.makeHtml($('#page_content').val()))

if $('#preview').length
  preview()
  $('#page_content').keyup(preview);
