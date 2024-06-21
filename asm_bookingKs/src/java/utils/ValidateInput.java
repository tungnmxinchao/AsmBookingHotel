/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author TNO
 */
public class ValidateInput {

    // Hàm kiểm tra tính hợp lệ của ngày check-in và check-out
    public static boolean isCheckoutDateValid(String checkinDate, String checkoutDate) {
        // Định dạng ngày tháng theo định dạng "yyyy-MM-dd"
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            // Chuyển đổi chuỗi ngày thành đối tượng Date
            Date checkIn = dateFormat.parse(checkinDate);
            Date checkOut = dateFormat.parse(checkoutDate);

            // Kiểm tra nếu ngày check-out sau ngày check-in và không trùng ngày check-in
            if (checkOut.after(checkIn) && !checkOut.equals(checkIn)) {
                return true;
            } else {
                return false;
            }
        } catch (ParseException e) {
            e.printStackTrace();
            // Nếu xảy ra lỗi khi parse ngày tháng, trả về false
            return false;
        }
    }
}
