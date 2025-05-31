$(document).ready(function () {
    ShowCount();
    $('body').on('click', '.btnAddtoCart', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        var quatity = 1; // Mặc định số lượng bằng 1

        // Lấy giá trị số lượng từ input
        var tQuantity = $('#qty').val();

        // Nếu có giá trị và nó là một số hợp lệ, gán vào quatity
        if (tQuantity && !isNaN(tQuantity) && parseInt(tQuantity) > 0) {
            quatity = parseInt(tQuantity);
        }

        // Kiểm tra số lượng trước khi gửi (optional)
        if (quatity <= 0) {
            quatity = 1; // Nếu số lượng không hợp lệ, gán lại là 1
        }
        //alert(id + " " + quatity);
        $.ajax({
            url: '/shoppingcart_64132077/addtocart',
            type: 'POST',
            data: { id: id, quantity: quatity },
            success: function (rs) {
                if (rs.Success) {
                    $('#checkout_items').html(rs.Count);
                    Swal.fire({
                        title: 'Thành công!',
                        text: rs.msg,
                        icon: 'success',
                        confirmButtonText: 'OK'
                    });
                } else {
                    Swal.fire({
                        title: 'Lỗi!',
                        text: rs.msg,
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            },
            error: function () {
                Swal.fire({
                    title: 'Lỗi!',
                    text: 'Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        });
    });

    $('body').on('click', '.btnDelete', function (e) {
        e.preventDefault();
        var id = $(this).data('id');

        // Hiển thị SweetAlert để xác nhận xóa
        Swal.fire({
            title: 'Bạn có chắc không?',
            text: 'Sản phẩm sẽ bị xóa khỏi giỏ hàng!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Xóa',
            cancelButtonText: 'Hủy',
            reverseButtons: true,
        }).then((result) => {
            if (result.isConfirmed) {
                // Người dùng nhấn nút "Xóa"
                $.ajax({
                    url: '/shoppingcart_64132077/Delete',
                    type: 'POST',
                    data: { id: id },
                    success: function (rs) {
                        if (rs.Success) {
                            Swal.fire({
                                toast: true,
                                position: 'top-end',
                                icon: 'success',
                                title: 'Sản phẩm đã được xóa khỏi giỏ hàng.',
                                showConfirmButton: false,
                                timer: 1500
                            });
                            $('#checkout_items').html(rs.Count);
                            $('#trow_' + id).remove();
                            LoadCart();
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Lỗi',
                                text: rs.msg,
                            });
                        }
                    },
                    error: function () {
                        Swal.fire({
                            icon: 'error',
                            title: 'Lỗi',
                            text: 'Không thể xóa sản phẩm khỏi giỏ hàng. Vui lòng thử lại sau.',
                        });
                    }
                });
            }
        });
    });
    $('body').on('click', '.btnUpdateCart', function (e) {
        e.preventDefault();

        // Lấy tất cả các hàng trong giỏ
        var updatedItems = [];

        // Lặp qua từng sản phẩm trong giỏ và lấy giá trị số lượng
        $('input[name="quantity[]"]').each(function () {
            var productId = $(this).data('id');
            var quantity = $(this).val();

            // Thêm thông tin sản phẩm vào danh sách
            updatedItems.push({
                ProductId: productId,
                Quantity: quantity
            });
        });

        // Gửi AJAX cập nhật số lượng sản phẩm
        $.ajax({
            url: '/shoppingcart_64132077/UpdateQuantity',
            type: 'POST',
            data: { updatedItems: updatedItems },
            success: function (rs) {
                if (rs.Success) {
                    Swal.fire({
                        title: 'Thành công!',
                        text: rs.msg,
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then(() => {
                        // Cập nhật lại giỏ hàng
                        location.reload();
                    });
                } else {
                    Swal.fire({
                        title: 'Lỗi!',
                        text: rs.msg,
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            },
            error: function () {
                Swal.fire({
                    title: 'Lỗi!',
                    text: 'Đã xảy ra lỗi khi cập nhật giỏ hàng.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        });
    });


});

function ShowCount() {
    $.ajax({
        url: '/shoppingcart_64132077/ShowCount',
        type: 'GET',
        success: function (rs) {
            $('#checkout_items').html(rs.Count);
        }
    });
}
