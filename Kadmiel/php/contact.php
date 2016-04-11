<?php
/*
* Contact Form Class
*
* Author: StarsThemes	
* Website: http://www.starsthemes.com 	
*
*/


header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
header('Content-type: application/json');

$admin_email = 'verificentrosdehidalgo@gmail.com'; // Your Email
$message_min_length = 10; // Min Message Length


class Contact_Form{
	function __construct($details, $email_admin, $message_min_length){
		
		$this->name = stripslashes($details['name']);
		$this->email = trim($details['email']);
		$this->subject = stripslashes($details['subject']);
		$this->message = stripslashes($details['message']);
	
		$this->email_admin = $email_admin;
		$this->message_min_length = $message_min_length;
		
		$this->response_status = 1;
		$this->response_html = '';
	}


	private function validateEmail(){
		$regex = '/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i';
	
		if($this->email == '') { 
			return false;
		} else {
			$string = preg_replace($regex, '', $this->email);
		}
	
		return empty($string) ? true : false;
	}


	private function validateFields(){
		// Check name
		if(!$this->name)
		{
			$this->response_html .= '<div class="alert row error rounded"><span class="icon"></span><strong>Error</strong> - Por favor introduce tu nombre<a href="#" class="alert_close">x</a></div>';
			$this->response_status = 0;
		}

		// Check email
		if(!$this->email)
		{
			$this->response_html .= '<div class="alert row error rounded"><span class="icon"></span><strong>Error</strong> - Por favor introduce una dirección de e-mail<a href="#" class="alert_close">x</a></div>';
			$this->response_status = 0;
		}
		
		// Check valid email
		if($this->email && !$this->validateEmail())
		{
			$this->response_html .= '<div class="alert row error rounded"><span class="icon"></span><strong>Error</strong> - Por favor intriduce un e-mail valido address<a href="#" class="alert_close">x</a></div>';
			$this->response_status = 0;
		}
		
		// Check message length
		if(!$this->message || strlen($this->message) < $this->message_min_length)
		{
			$this->response_html .= '<div class="alert row error rounded"><span class="icon"></span><strong>Error</strong> - Por favor introduce tu mensaje. Debe tener al menos '.$this->message_min_length.' caracteres<a href="#" class="alert_close">x</a></div>';
			$this->response_status = 0;
		}
	}


	private function sendEmail(){
		$mail = mail($this->email_admin, $this->subject, $this->message,
			 "From: ".$this->name." <".$this->email.">\r\n"
			."Reply-To: ".$this->email."\r\n"
		."X-Mailer: PHP/" . phpversion());
	
		if($mail)
		{
			$this->response_status = 1;
			$this->response_html = '<div class="alert row success"><span class="icon"></span><strong>Success</strong> - Email enviado, Gracias!<a href="#" class="alert_close">x</a></div>';
		}
	}


	function sendRequest(){
		$this->validateFields();
		if($this->response_status)
		{
			$this->sendEmail();
		}

		$response = array();
		$response['status'] = $this->response_status;	
		$response['html'] = $this->response_html;
		
		echo json_encode($response);
	}
}


$contact_form = new Contact_Form($_POST, $admin_email, $message_min_length);
$contact_form->sendRequest();

?>