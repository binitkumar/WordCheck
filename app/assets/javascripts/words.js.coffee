# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  status_bar = $("#status_bar").progressbar(
    warningMarker: seq_per
    dangerMarker: seq_per
    maximum: 100
    step: 1
  )
  i = 0
  while i <= seq_per
    $("#status_bar").progressbar "stepIt"
    i++
  $(".chart").easyPieChart
    easing: "easeOutBounce"
    onStep: (from, to, percent) ->
      $(@el).find(".percent").text Math.round(correct_per)
      return

    barColor: "black"

  chart = window.chart = $(".chart").data("easyPieChart")
  chart.update correct_per

  $("#question_form").bind("ajax:success", (xhr, data, status) ->
    console.log(data)
    setTimeout (->
      if data.correct_answer is true
        $("#reportalert").text "Your answer is correct"
      else
        $("#reportalert").text "Your answer is wrong"
      return
    ), 5

    window.location.href = data.redirect_path
    return
  ).bind "ajax:error", (xhr, status, error) ->
    $("#reportalert").text "Failed."
    return
  return

