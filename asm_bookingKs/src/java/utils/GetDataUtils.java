/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.text.NumberFormat;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Locale;

/**
 *
 * @author TNO
 */
public class GetDataUtils {

    public static String formatToVietnamCurrency(int amount) {
        // Lấy instance của NumberFormat cho định dạng tiền tệ Việt Nam
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

        // Định dạng số tiền và trả về chuỗi kết quả
        return currencyFormatter.format(amount);
    }

    // Hàm parse từ chuỗi tiền tệ Việt Nam sang kiểu int
    public static int parseVietnamCurrency(String amount) {
        // Lấy instance của NumberFormat cho định dạng tiền tệ Việt Nam
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));

        try {
            // Parse chuỗi tiền tệ thành số
            Number number = currencyFormatter.parse(amount);

            // Trả về giá trị int của số đã parse
            return number.intValue();
        } catch (ParseException e) {
            e.printStackTrace();
            // Nếu xảy ra lỗi khi parse, trả về 0
            return 0;
        }
    }

    // Hàm tính số ngày ở khách sạn dựa trên ngày check-in và check-out
    public static int calculateStayDuration(String checkinDate, String checkoutDate) {
        // Định dạng ngày tháng theo định dạng "yyyy-MM-dd"
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // Chuyển đổi chuỗi ngày thành đối tượng LocalDate
        LocalDate checkIn = LocalDate.parse(checkinDate, dateFormatter);
        LocalDate checkOut = LocalDate.parse(checkoutDate, dateFormatter);

        // Tính số ngày giữa ngày check-in và check-out
        long numberOfDays = ChronoUnit.DAYS.between(checkIn, checkOut);

        // Chuyển đổi kết quả từ long sang int
        return (int) numberOfDays;
    }
    
}
