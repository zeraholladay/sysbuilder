componentReady = ->
  # handle removing elements when the destroy button is clicked
  $(".component-destroy").livequery ->
    $(this).click ->
      event.preventDefault()
      renderNotSaved()

      headingDomId   = $(this).closest(".component-list").attr("id").replace("-container", "-heading")
      countElement   = $(this).closest("form").find("#" + headingDomId).find(".component-count")
      containerDomId = $(this).closest(".component-list").attr("id")

      #$(this).closest(".assigned-component").remove()
      $(this).closest(".assigned-component").slideUp ->
        $(this).remove()
        $(countElement).html $("#" + containerDomId).find(".assigned-component").size()
        calculateCosts()
        return
      return

# handle turbolinks rails 4 document ready
$(document).ready(componentReady)
$(document).on('page:load', componentReady)
