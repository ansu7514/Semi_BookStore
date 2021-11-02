package db;

public class StringToBlob {
	
	public String byte2HexStr(byte pByte)
	{
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 2; i++) {
			int tInt = (pByte >> 4 * (1-i)) & 0x0f;
			if (tInt > 9) sb.append((char)('A' + (tInt - 10)));
			else sb.append((char)('0' + tInt));			
		}
		return sb.toString();
	}


	public String byteArray2Blob(byte[] pByteArray)
	{
		String rv = null;
		if (pByteArray != null)
		{
			StringBuffer sb = new StringBuffer("X'");
			for(int i = 0; i < pByteArray.length; i++)
			{
				sb.append(byte2HexStr(pByteArray[i]));
			}
			sb.append("'");
			rv = sb.toString();
		}
		return rv;
	}

	public String str2Blob(String pStr)
	{
		String rv = null;
		if (pStr != null)
		{
			byte[] tByteArray = pStr.getBytes();
			rv = byteArray2Blob(tByteArray);
			tByteArray = null;
		}
		return rv;
	}

}
