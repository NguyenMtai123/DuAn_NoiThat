$(document).ready(function () {
    $('body').on('click', '#BtnDeleteAll', function (e) {
        e.preventDefault();
        var selectedIds = [];
        var checkboxes = $(this).parents('.card').find('tr td input:checkbox.cbkItem:checked');

        checkboxes.each(function () {
            selectedIds.push($(this).val());
        });

        if (selectedIds.length === 0) {
            Swal.fire({
                title: "Chưa chọn bản ghi!",
                text: "Vui lòng chọn ít nhất một bản ghi để xóa.",
                icon: "warning",
                confirmButtonText: "OK",
            });
            return;
        }

        Swal.fire({
            title: "Bạn có chắc chắn?",
            text: "Bạn có muốn xóa các bản ghi đã chọn không?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#d33",
            cancelButtonColor: "#3085d6",
            confirmButtonText: "Xóa",
            cancelButtonText: "Hủy",
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/Admin/PostCategory_64132077/DeleteAll',
                    type: 'POST',
                    data: { ids: selectedIds.join(",") },
                    success: function (response) {
                        if (response.success) {
                            Swal.fire({
                                title: "Đã xóa!",
                                text: "Các bản ghi đã được xóa thành công.",
                                icon: "success",
                                confirmButtonText: "OK",
                            }).then(() => {
                                location.reload(); // Tải lại trang
                            });
                        } else {
                            Swal.fire("Lỗi!", "Xóa bản ghi không thành công.", "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Lỗi!", "Đã xảy ra lỗi khi xóa các bản ghi.", "error");
                    },
                });
            }
        });
    });
    // Xử lý sự kiện khi bấm nút Xóa
    $(".btn-delete").click(function () {
        var PostCategoryId = $(this).data("id");
        var row = $("#row-" + PostCategoryId);

        Swal.fire({
            title: "Bạn có chắc chắn?",
            text: "Bạn có muốn xóa danh mục này không?",
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
                    url: "/Admin/PostCategory_64132077/Delete",
                    type: "POST",
                    data: { id: PostCategoryId },
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
                        Swal.fire("Lỗi!", "Đã xảy ra lỗi khi xóa danh mục.", "error");
                    },
                });
            }
        });
    });

    // Xử lý sự kiện click vào nút đổi trạng thái
    $(".btn-active").click(function (e) {
        e.preventDefault();

        var PostCategoryId = $(this).data("id");
        var button = $(this);

        $.ajax({
            url: "/Admin/PostCategory_64132077/ChangeStatus",
            type: "POST",
            data: { id: PostCategoryId },
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

    $('body').on('change', '#SelectAll', function () {
        var checkStatus = this.checked;
        var checkbox = $(this).parents('.card-body').find('tr td input:checkbox');
        checkbox.each(function () {
            this.checked = checkStatus;
            if (this.checked) {
                checkbox.attr('selected', 'checked');
            } else {
                checkbox.attr('selected', '');
            }
        });
    });
    $('body').on('change', '.cbkItem', function () {
        var allCheckboxes = $(this).closest('.card-body').find('tr td input:checkbox.cbkItem');
        var totalCheckboxes = allCheckboxes.length;
        var checkedCheckboxes = allCheckboxes.filter(':checked').length;

        // Nếu tất cả checkbox được chọn, kích hoạt "Chọn tất cả"
        if (checkedCheckboxes === totalCheckboxes) {
            $('#SelectAll').prop('checked', true);
        } else {
            $('#SelectAll').prop('checked', false);
        }
    });
});