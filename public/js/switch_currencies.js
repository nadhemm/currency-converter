
function switch_currency(){
    let selected_from = $("select.input_cur").children("option:selected").val();
    let selected_to = $("select.output_cur").children("option:selected").val();
    $("select.input_cur").val(selected_to);
    $("select.output_cur").val(selected_from);
}
