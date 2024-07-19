package com.grab.hopital.vo;

public class Hospital_license_registration {
	
	private int license_registration;
	private int hospital_no;
	private String new_license;
	private String org_licens;
	private String new_registration;
	private String org_registration;
	
		public Hospital_license_registration() {
			super();
		}

		public Hospital_license_registration(int license_registration, int hospital_no, String new_license, String org_licens, String new_registration,
				String org_registration) {
			super();
			this.license_registration = license_registration;
			this.hospital_no = hospital_no;
			this.new_license = new_license;
			this.org_licens = org_licens;
			this.new_registration = new_registration;
			this.org_registration = org_registration;
		}

		
		public int getLicense_registration() {
			return license_registration;
		}

		public void setLicense_registration(int license_registration) {
			this.license_registration = license_registration;
		}

		public int getHospital_no() {
			return hospital_no;
		}

		public void setHospital_no(int hospital_no) {
			this.hospital_no = hospital_no;
		}

		public String getNew_license() {
			return new_license;
		}

		public void setNew_license(String new_license) {
			this.new_license = new_license;
		}

		public String getOrg_licens() {
			return org_licens;
		}

		public void setOrg_licens(String org_licens) {
			this.org_licens = org_licens;
		}

		public String getNew_registration() {
			return new_registration;
		}

		public void setNew_registration(String new_registration) {
			this.new_registration = new_registration;
		}

		public String getOrg_registration() {
			return org_registration;
		}

		public void setOrg_registration(String org_registration) {
			this.org_registration = org_registration;
		}

		@Override
		public String toString() {
			return "Hospital_license_registration [license_registration=" + license_registration + ", hospital_no="
					+ hospital_no + ", new_license=" + new_license + ", org_licens=" + org_licens
					+ ", new_registration=" + new_registration + ", org_registration=" + org_registration + "]";
		}

		
		
}
