# Bash Script: caller.sh

This script continuously sends HTTP requests to a specified API URL and tracks the status codes of the responses. It calculates and displays the percentage of each status code received when the script is terminated.

## Script Details

- **API_URL**: The URL to which the HTTP requests are sent.
- **total_requests**: A counter for the total number of requests made.
- **status_codes**: An associative array to store the count of each status code received.

## Functions

### `finish`
This function is triggered when the script is terminated (e.g., by pressing `Ctrl+C`). It calculates and prints the percentage of each status code received.

## Trap

- **SIGINT**: The script traps the `SIGINT` signal (usually triggered by `Ctrl+C`) and calls the `finish` function.

## Main Loop

The script runs an infinite loop that:
1. Sends an HTTP request to the `API_URL` using `curl`.
2. Increments the `total_requests` counter.
3. Increments the count for the received status code in the `status_codes` array.

## Example Usage

To run the script, use the following command in the terminal:

```bash
./caller.sh
