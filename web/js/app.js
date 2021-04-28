// code for adding post to Servlet

$('#add-post-form').submit(function(event){
    event.preventDefault();
    let form = new FormData(this);
    console.log('submitted data ',form)
    $.ajax({
        url:'AddPostFormServlet',
        type:'POST',
        data:form,
        processData: false,
        contentType: false,
        success: function (data, textStatus, jqXHR) {
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log('servlet');
        }
        
    });
});