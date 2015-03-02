# Alteryx Service Basic Load Test
A small batch script which can be used to add jobs to the Alteryx Service queue.  

#Server Settings
	host   = address and port of your alteryx server
	secret = alteryx server secret.  This can be found by running "C:\Program Files\Alteryx\bin\AlteryxService.exe getsecret"
	alteryx_service = path to your alteryx installation.

#File Settings
	working_dir = path to your test modules
	work_module = name of your test module
	last_module = name of the last module to run
	last_file   = name of the file to watch

#Job Settings
	jobs = number of jobs to add to the queue
