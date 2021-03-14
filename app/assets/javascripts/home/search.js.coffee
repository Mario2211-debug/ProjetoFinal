jQuery ->
 #$('#queixa_assunto_id').parent().hide()
 queixa = $('#queixa').html()
 empresa = $('#empresa').html()
 $('#queixa').change ->
    empresa = $('#queixa_empresa_id :selected').text()
    escaped_empresa = empresa.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(assuntos).filter("optgroup[label='#{escaped_empresa}']").html()
    if options
      $('#queixa_assunto_id').html(options)
    #  $('#queixa_assunto_id').parent().show()
    else
      $('#queixa_assunto_id').empty()
  #    $('#queixa_assunto_id').parent().hide()
