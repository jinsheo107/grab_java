package com.grab.hopital.vo;

import java.time.LocalDateTime;

public class hospital_time {

	private int time_no;
	private int hospital_no;
	private String time_day;
	private LocalDateTime time_start;
	private LocalDateTime time_end;
	private LocalDateTime lunch_start;
	private LocalDateTime lunch_end;
	private String rest_day;
	
	public hospital_time() {
		super();
	}

	public int getTime_no() {
		return time_no;
	}

	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}

	public int getHospital_no() {
		return hospital_no;
	}

	public void setHospital_no(int hospital_no) {
		this.hospital_no = hospital_no;
	}

	public String getTime_day() {
		return time_day;
	}

	public void setTime_day(String time_day) {
		this.time_day = time_day;
	}

	public LocalDateTime getTime_start() {
		return time_start;
	}

	public void setTime_start(LocalDateTime time_start) {
		this.time_start = time_start;
	}

	public LocalDateTime getTime_end() {
		return time_end;
	}

	public void setTime_end(LocalDateTime time_end) {
		this.time_end = time_end;
	}

	public LocalDateTime getLunch_start() {
		return lunch_start;
	}

	public void setLunch_start(LocalDateTime lunch_start) {
		this.lunch_start = lunch_start;
	}

	public LocalDateTime getLunch_end() {
		return lunch_end;
	}

	public void setLunch_end(LocalDateTime lunch_end) {
		this.lunch_end = lunch_end;
	}

	public String getRest_day() {
		return rest_day;
	}

	public void setRest_day(String rest_day) {
		this.rest_day = rest_day;
	}

	@Override
	public String toString() {
		return "hospital_time [time_no=" + time_no + ", hospital_no=" + hospital_no + ", time_day=" + time_day
				+ ", time_start=" + time_start + ", time_end=" + time_end + ", lunch_start=" + lunch_start
				+ ", lunch_end=" + lunch_end + ", rest_day=" + rest_day + "]";
	}
	
	
}
