/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.text.NumberFormat;
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
}
