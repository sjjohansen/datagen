#!/usr/bin/env python

import sys
import random
import string
import argparse

DEFAULT_NUM_USERS = 10
DEFAULT_NUM_EVENTS = 10
DEFAULT_START_ID = 0

def randomstring(len=8):
  randomstr = ''.join(random.choice(string.lowercase) for x in range(len))
  return randomstr

def randomtime(start, end):
  return random.randint(start, end)

def randompick(bag):
  return bag[random.randint(0, len(bag)-1)]

def genusers(nousers=DEFAULT_NUM_USERS):
  users = []
  for userid in range(nousers):
    users.append(randomstring())
  return users

def genevents(users, start_time, end_time, noevents=DEFAULT_NUM_EVENTS, start_id=DEFAULT_START_ID):
  events = []
  for eventid in range(start_id, noevents + start_id):
    events.append(
      ','.join(
	[
	  str(eventid),
	  randompick(users),
	  str(randomtime(start_time, end_time))
	]
      )
    )
  return events

def cliargs():
  parser = argparse.ArgumentParser()

  parser.add_argument('start_epoch_time',
		      help='start time in seconds since 1 Jan 1970',
		      action="store",
		      type=int)
  parser.add_argument('end_epoch_time',
		      help='end time in seconds since 1 Jan 1970',
		      action="store",
		      type=int)
  parser.add_argument('-u', '--num_users',
		      help='number of random users to create',
		      action="store",
		      default=DEFAULT_NUM_USERS,
		      type=int)
  parser.add_argument('-e', '--num_events',
		      help='number of random events to create',
		      action="store",
		      default=DEFAULT_NUM_EVENTS,
		      type=int)
  parser.add_argument('-s', '--start_id',
		      help='the first id in the eventid sequence',
		      action="store",
		      default=DEFAULT_START_ID,
		      type=int)
  return parser.parse_args()

def main(confargs):
  start_epoch = confargs.start_epoch_time
  end_epoch = confargs.end_epoch_time
  num_users = confargs.num_users
  num_events = confargs.num_events
  start_id = confargs.start_id

  users = genusers(num_users)
  events = genevents(users, start_epoch, end_epoch, num_events, start_id)

  for event in events:
    print event

if __name__ == '__main__':
  main(cliargs())
  sys.exit(0)

