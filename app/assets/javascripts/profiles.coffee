$ ->
  $('a[title]').tooltip()
  $('.userProfile .btn-submit').on 'click', (e) ->
    formname = $(this).attr('name')
    tabname = $(this).attr('href')
    if $('#' + formname)[0].checkValidity()
      e.preventDefault()
      $('ul.nav li a[href="' + tabname + '"]').parent().removeClass 'disabled'
      $('ul.nav li a[href="' + tabname + '"]').trigger 'click'
    return
  $('ul.nav li').on 'click', (e) ->
    if $(this).hasClass('disabled')
      e.preventDefault()
      return false
    return
  return
$ ->

  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        $('#img_prev').attr 'src', e.target.result
        return

      reader.readAsDataURL input.files[0]
    return

  $('#first_photo').change ->
    $('#img_prev').removeClass 'hidden'
    readURL this
    return
  return