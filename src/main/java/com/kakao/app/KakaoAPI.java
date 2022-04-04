package com.kakao.app;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class KakaoAPI {

	//kakao 로그인 인가코드 .토큰 .api 가져오기
	public String getAccessToken(String code) {
		String accessToken = "";
		String refreshToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=ce61dd2f0b3b7b541a284a3c4576e17a");

			sb.append("&redirect_uri=http://localhost:8080/member/kakaologin");
			sb.append("&code="+code);

			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("response code = " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			while((line = br.readLine())!=null) {
				result += line;
			}
			System.out.println("response body="+result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

			br.close();
			bw.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return accessToken;
	}


	public HashMap<String, Object> getUserInfo(String accessToken) {
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqUrl = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode =" + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body ="+result); //결과값 200(성공) 400(실패)

			JsonParser parser = new JsonParser();

			JsonElement element =  parser.parse(result);
			String id = element.getAsJsonObject().get("id").getAsString();
//			String email = element.getAsJsonObject().get("account_email").getAsString();
			String connected_at = element.getAsJsonObject().get("connected_at").getAsString();

			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String birthday = kakaoAccount.getAsJsonObject().get("birthday").getAsString();
			String gender = kakaoAccount.getAsJsonObject().get("gender").getAsString();


			String kid = "kakao_" + id;
//			String Kemail = "kakao_" + email;
			userInfo.put("birthday", birthday);
			userInfo.put("gender", gender);
			userInfo.put("id", kid);
//			userInfo.put("email", Kemail);

			userInfo.put("connected_at", connected_at);





		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfo;
	}


	public void kakaoLogout(String accessToken) { //로그아웃
		String reqURL = "http://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode = " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String result = "";
			String line = "";

			while((line = br.readLine()) != null) {
				result+=line;
			}
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}





}