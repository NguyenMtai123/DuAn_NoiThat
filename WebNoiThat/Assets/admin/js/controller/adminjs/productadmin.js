$(document).ready(function () {
    $("#dialog").dialog({
        autoOpen: false,
        show: "fade",
        hide: "fade",
        modal: true,
        height: '600',
        width: '800',
        resizable: true,
        title: 'Quản lý ảnh sản phẩm',
        close: function () {
            window.location.reload();
        }
    });
    $('body').on("click", ".imgproduct", function () {
        var proid = $(this).attr("data-id");
        $("#dialog #myIframe").attr("src", "/admin/ProductImage_64132077/Index?id=" + proid);
        $('#dialog').dialog('open');
        return false;
    });
    $('body').on('click', '#BtnDeleteAll', function (e) {
        e.preventDefault();
        var str = "";
        var checkbox = $(this).parents('.card').find('tr td input:checkbox');
        var i = 0;
        checkbox.each(function () {
            if (this.checked) {
                var _id = $(this).val();
                if (i === 0) {
                    str += _id;
                } else {
                    str += "," + _id;
                }
                i++;
            } else {
                checkbox.attr('selected', '');
            }
        });
        if (str.length > 0) {
            var conf = confirm('Bạn có muốn xóa các bản ghi này hay không?');
            if (conf === true) {
                $.ajax({
                    url: '/admin/ProductImage_64132077/deleteAll',
                    type: 'POST',
                    data: { ids: str },
                    success: function (rs) {
                        if (rs.success) {
                            location.reload();
                        }
                    }
                });
            }
        }
    });
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
                    url: '/Admin/Product_64132077/DeleteAll',
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
        var ProductId = $(this).data("id");
        var row = $("#row-" + ProductId);

        Swal.fire({
            title: "Bạn có chắc chắn?",
            text: "Bạn có muốn xóa sản phẩm này không?",
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
                    url: "/Admin/Product_64132077/Delete",
                    type: "POST",
                    data: { id: ProductId },
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
                        Swal.fire("Lỗi!", "Đã xảy ra lỗi khi xóa sản phẩm.", "error");
                    },
                });
            }
        });
    });

    // Xử lý sự kiện click vào nút đổi trạng thái
    //$(".btn-active").click(function (e) {
    //    e.preventDefault();

    //    var ProductId = $(this).data("id");
    //    var button = $(this);

    //    $.ajax({
    //        url: "/Admin/Product_64132077/ChangeStatus",
    //        type: "POST",
    //        data: { id: ProductId },
    //        success: function (response) {
    //            if (response.success) {
    //                // Cập nhật trạng thái nút
    //                if (response.status) {
    //                    button.text("Active");
    //                    button.removeClass("badge-danger").addClass("badge-success");
    //                } else {
    //                    button.text("Blocked");
    //                    button.removeClass("badge-success").addClass("badge-danger");
    //                }

    //                Swal.fire({
    //                    title: "Thành công!",
    //                    text: "Trạng thái đã được cập nhật.",
    //                    icon: "success",
    //                    confirmButtonText: "OK",
    //                });
    //            } else {
    //                Swal.fire("Lỗi!", response.message, "error");
    //            }
    //        },
    //        error: function () {
    //            Swal.fire("Lỗi!", "Đã xảy ra lỗi khi đổi trạng thái.", "error");
    //        },
    //    });
    //});

    $('body').on('click', '.btn-active', function (e) {
        e.preventDefault();
        var btn = $(this);
        var id = btn.data("id");

        // Gửi yêu cầu cập nhật trạng thái IsHot
        $.ajax({
            url: '/Admin/Product_64132077/ChangeStatus',
            type: 'POST',
            data: { id: id },
            success: function (response) {
                if (response.success) {
                    if (response.status) {
                        btn.html("<i class='fa fa-check text-success'></i>");
                    } else {
                        btn.html("<i class='fas fa-times text-danger'></i>");
                    }

                    Swal.fire({
                        toast: true,
                        position: 'top-end',
                        icon: 'success',
                        title: 'Trạng thái Home đã được cập nhật.',
                        showConfirmButton: false,
                        timer: 1500
                    });
                } else {
                    Swal.fire("Lỗi!", response.message, "error");
                }
            },
            error: function () {
                Swal.fire("Lỗi!", "Đã xảy ra lỗi khi cập nhật trạng thái Home.", "error");
            }
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

    $('body').on('click', '.btnSale', function (e) {
        e.preventDefault();
        var btn = $(this);
        var id = btn.data("id");

        // Gửi yêu cầu cập nhật trạng thái IsSale
        $.ajax({
            url: '/admin/Product_64132077/IsSale',
            type: 'POST',
            data: { id: id },
            success: function (response) {
                if (response.success) {
                    if (response.IsSale) {
                        btn.html("<i class='fa fa-check text-success'></i>");
                    } else {
                        btn.html("<i class='fas fa-times text-danger'></i>");
                    }

                    Swal.fire({
                        toast: true,
                        position: 'top-end',
                        icon: 'success',
                        title: 'Trạng thái Sale đã được cập nhật.',
                        showConfirmButton: false,
                        timer: 1500
                    });
                } else {
                    Swal.fire("Lỗi!", response.message, "error");
                }
            },
            error: function () {
                Swal.fire("Lỗi!", "Đã xảy ra lỗi khi cập nhật trạng thái Sale.", "error");
            }
        });
    });


});