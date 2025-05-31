var contact = {
    init: function () {
        contact.registerEvents();
    },
    registerEvents: function () {
        $('#btnSend').off('click').on('click', function (e) {
            e.preventDefault(); // Ngăn hành động submit mặc định của form
            var name = $('#cname').val();
            var email = $('#cemail').val();
            var phone = $('#cphone').val();
            var address = $('#caddress').val();
            var message = $('#cmessage').val();

            if (!name || !email || !message) {
                Swal.fire({
                    icon: 'warning',
                    title: 'Thông báo',
                    text: 'Vui lòng nhập đầy đủ các trường bắt buộc!',
                });
                return;
            }

            $.ajax({
                url: '/Contact_64132077/Send', // Đảm bảo URL chính xác
                type: 'POST',
                dataType: 'json',
                data: {
                    name: name,
                    email: email,
                    phone: phone,
                    address: address,
                    message: message
                },
                success: function (res) {
                    if (res.status) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Thành công!',
                            text: res.message || 'Phản hồi của bạn đã được gửi thành công!',
                        }).then(() => {
                            // Reset form sau khi gửi thành công
                            $('#cname').val('');
                            $('#cemail').val('');
                            $('#cphone').val('');
                            $('#caddress').val('');
                            $('#cmessage').val('');
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Thất bại!',
                            text: res.message || 'Đã xảy ra lỗi. Vui lòng thử lại sau.',
                        });
                    }
                },
                error: function () {
                    Swal.fire({
                        icon: 'error',
                        title: 'Lỗi!',
                        text: 'Không thể kết nối đến server. Vui lòng thử lại sau.',
                    });
                }
            });
        });
    }
}
contact.init();
