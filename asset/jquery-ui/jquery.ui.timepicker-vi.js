jQuery(function($){
    $.timepicker.regional['vi'] = {
                hourText: 'Giờ',
                minuteText: 'Phút',
                amPmText: ['AM', 'PM'],
                closeButtonText: 'Đóng',
                nowButtonText: 'Hiện tại',
                deselectButtonText: 'Hủy' }
    $.timepicker.setDefaults($.timepicker.regional['vi']);
});