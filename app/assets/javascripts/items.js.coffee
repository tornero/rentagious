# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    subcategories = $('#item_subcategory').html()
    $('#item_category').change ->
        category = $('#item_category :selected').text()
        options = $(subcategories).filter("optgroup[label='#{category}']").html()
        if options
            $('#item_subcategory').html(options)
        else
            $('#item_subcategory').empty()