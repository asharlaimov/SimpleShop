# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:change", ->
  jQuery ->
    $('#sortable').sortable(
      containment: 'parent'
      placeholder: 'ui-state-highlight'
      tolerance: 'pointer'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
    );