# Alteryx Service Basic Load Test

A small batch script which can be used to add jobs to the Alteryx Service queue.  The basic premise here is that you have a job that you want to load test on the server.  This job is represented as "work_module" in the script.  You can set the number of jobs to put into the queue by modifying the "jobs" setting.  

After all the jobs are added to the queue, we need a way to know when all of the jobs in the queue have been executed, so the last module added to the queue needs to perform an operation to signal that it has run to completion.  In this script, this module is represented as "last_module".  In this implementation, "last_module" writes out a file specified in the setting "last_file" which the script waits for until its finds the file.  Once the "last_file" is found, it is removed from the file system and the START time and END times are printed to the console.

## The following settings can be configured

### Server Settings
	host   = address and port of your alteryx server
	secret = alteryx server secret.  This can be found by running "C:\Program Files\Alteryx\bin\AlteryxService.exe getsecret"
	alteryx_service = path to your alteryx installation.

### File Settings
	working_dir = path to your test modules
	work_module = name of your test module
	last_module = name of the last module to run
	last_file   = name of the file to watch

### Job Settings
	jobs = number of jobs to add to the queue
