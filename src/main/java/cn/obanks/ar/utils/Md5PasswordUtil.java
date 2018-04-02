package cn.obanks.ar.utils;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.apache.commons.lang3.StringUtils;

public class Md5PasswordUtil {
	private static final char[] HEX_DIGITS = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	public  final String encode(String source) {
		if (StringUtils.isNotBlank(source)) {
			try {
				MessageDigest messageDigest = MessageDigest.getInstance("MD5");
				messageDigest.update(source.getBytes());
				byte[] digest = messageDigest.digest();
				final StringBuilder result = new StringBuilder(digest.length * 2);
				for (int i = 0; i < digest.length; i++) {
					result.append(HEX_DIGITS[(digest[i] >> 4) & 0x0f]);
					result.append(HEX_DIGITS[digest[i] & 0x0f]);
				}
				return result.toString();
			}
			catch (NoSuchAlgorithmException e) {
				throw new RuntimeException(e);
			}
		}
		throw new IllegalArgumentException();
	}

}