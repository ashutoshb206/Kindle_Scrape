#!/usr/bin/env python3
"""
Test script for the Amazon Kindle scraper
"""
import asyncio
import sys
import os
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

import app

def test_scraper():
    # Use the global JOBS from app.py
    job_id = "test_job"
    app.JOBS[job_id] = {
        "status": "running",
        "q": app.queue.Queue(),
        "books": [],
        "error": None,
    }

    # Sample Amazon Kindle bestseller URL
    url = "https://www.amazon.com/Best-Sellers-Kindle-Store/zgbs/digital-text/154606011/ref=zg_bs_nav_kstore_0"

    # Run the scraper
    asyncio.run(app.run_scrape(
        job_id=job_id,
        url=url,
        scrape_details=False,  # Skip details for faster testing
        max_books=10  # Just test with 10 books
    ))

    # Print results
    job = app.JOBS[job_id]
    if job["status"] == "done":
        books = job["books"]
        print(f"Successfully scraped {len(books)} books")
        for i, book in enumerate(books[:5], 1):
            print(f"\nBook {i}:")
            print(f"  Title: {book.get('title', 'N/A')}")
            print(f"  Rating: {book.get('rating', 'N/A')}")
            print(f"  Reviews: {book.get('num_reviews', 'N/A')}")
    else:
        print(f"Scrape failed: {job.get('error', 'Unknown error')}")

if __name__ == "__main__":
    test_scraper()
