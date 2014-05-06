
$ ->
  $("#main-title").keyup (e) ->
    text = $(e.target).val()
    $(".main-title").html text

  $("#second-title").keyup (e) ->
    text = $(e.target).val()
    $(".second-title").html text

  $("#font-color").keyup (e) ->
    text = $(e.target).val()
    $(".pic-container").css "color", text

  $("#fileupload-btn").click (e) ->
    $("#fileupload").click()

  fileLoaded = (reader) ->
    console.log "loaded!", reader.result
    $("#image").attr("src", reader.result)

  $("#fileupload").change (e) ->
    console.log "change!"
    input = $(e.target).closest "input"
    file = input[0].files[0]
    reader = new FileReader()
    reader.readAsDataURL(file)
    reader.onloadend = => fileLoaded reader

  $("#save").click (e) ->
    html2canvas $(".pic-container .inner"),
      onrendered: (canvas) ->
        myImage = canvas.toDataURL("image/png")
        window.open myImage
