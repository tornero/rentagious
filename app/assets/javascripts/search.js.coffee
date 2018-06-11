# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    subcategories = $('#q_subcategory_eq').html()
    $('#q_category_eq').change ->
        category = $('#q_category_eq :selected').text()
        options = $(subcategories).filter("optgroup[label='#{category}']").html()
        if options
            $('#q_subcategory_eq').html(options)
        else
            $('#q_subcategory_eq').empty()