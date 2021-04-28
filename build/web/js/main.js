$(document).ready(function () {
    let editStatus = false;
    $('#edit-profile-btn').click(function () {

        if (editStatus === false) {
            $('#profile-edit').show();
            $('#profile-table').hide();
            editStatus = true;
            $(this).text('back');
        } else {
            $('#profile-edit').hide();
            $('#profile-table').show();
            editStatus = false;
            $(this).text('Edit');
        }


    });
    getPost(0);
});

function getPost(catid, element) {
    $('#loader').show();
    $('#post-container').hide();
    if (element) {
        $('.list-group-item').removeClass('active');
        $(element).addClass('active');
    }
    $.ajax({
        url: 'load_post.jsp',
        data: {cid: catid},
        success: function (data, textStatus, jqXHR) {
            $('#loader').hide();
            $('#post-container').show();
            $('#post-container').html(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log('servlet');
        }
    });

}