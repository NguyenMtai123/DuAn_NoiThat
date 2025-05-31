function addToWishlist(productId) {
    $.ajax({
        url: '/WishList_64132077/AddToWishlist',
        type: 'POST',
        data: { productId: productId },
        success: function (response) {
            if (response.success) {
                // Thông báo thành công với SweetAlert
                Swal.fire({
                    icon: 'success',
                    title: 'Thành công!',
                    text: response.message,
                    showConfirmButton: false,
                    timer: 2000
                });

                // Cập nhật số lượng yêu thích trên header
                $('.wishlist-count').text(response.wishlistCount);
            } else {
                // Thông báo lỗi với SweetAlert
                Swal.fire({
                    icon: 'info',
                    title: 'Thông báo',
                    text: response.message,
                    showConfirmButton: false,
                    timer: 2000
                });
            }
        },
        error: function () {
            // Thông báo lỗi hệ thống với SweetAlert
            Swal.fire({
                icon: 'error',
                title: 'Lỗi',
                text: 'Có lỗi xảy ra, vui lòng thử lại.',
                showConfirmButton: false,
                timer: 2000
            });
        }
    });
}
