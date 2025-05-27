$(document).ready(function () {
    $(".btn-delete").click(function () {
        var PostId = $(this).data("id");
        var row = $("#row-" + PostId);

        Swal.fire({
            title: "Bạn có chắc chắn?",
            text: "Bạn có muốn xóa menu này không?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#d33",
            cancelButtonColor: "#3085d6",
            confirmButtonText: "Xóa",
            cancelButtonText: "Hủy",
        }).then((result) => {
            if (result.isConfirmed) {
                // Gửi yêu cầu xóa qua AJAX
                $.ajax({
                    url: "/Admin/Menu_64132077/Delete",
                    type: "POST",
                    data: { id: PostId },
                    success: function (response) {
                        if (response.success) {
                            Swal.fire({
                                title: "Đã xóa!",
                                text: response.message,
                                icon: "success",
                                confirmButtonText: "OK",
                            }).then(() => {
                                location.reload(); // Cập nhật lại trang
                            });
                        } else {
                            Swal.fire("Lỗi!", response.message, "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Lỗi!", "Đã xảy ra lỗi khi xóa menu.", "error");
                    },
                });
            }
        });
    });

    // Xử lý sự kiện click vào nút đổi trạng thái
    $(".btn-active").click(function (e) {
        e.preventDefault();

        var PostId = $(this).data("id");
        var button = $(this);

        $.ajax({
            url: "/Admin/Menu_64132077/ChangeStatus",
            type: "POST",
            data: { id: PostId },
            success: function (response) {
                if (response.success) {
                    // Cập nhật trạng thái nút
                    if (response.status) {
                        button.text("Active");
                        button.removeClass("badge-danger").addClass("badge-success");
                    } else {
                        button.text("Blocked");
                        button.removeClass("badge-success").addClass("badge-danger");
                    }

                    Swal.fire({
                        title: "Thành công!",
                        text: "Trạng thái đã được cập nhật.",
                        icon: "success",
                        confirmButtonText: "OK",
                    });
                } else {
                    Swal.fire("Lỗi!", response.message, "error");
                }
            },
            error: function () {
                Swal.fire("Lỗi!", "Đã xảy ra lỗi khi đổi trạng thái.", "error");
            },
        });
    });
});