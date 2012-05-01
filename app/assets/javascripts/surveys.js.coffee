$ () ->
  $(".rank input[type=radio]").click () ->
    clicked = $(this)
    clicked.closest("table").find("input[type=radio]").not(clicked).each () ->
      if $(this).data("col") == clicked.data("col")
        $(this).prop("checked", false)
