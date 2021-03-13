from behave import *
from features.lib.pages.maps_page import *


@given("The user is at the applications website")
def step_impl(context):
    page = MapsPage(context)
    page.visit('https://www.google.com/maps')
    page.consent_to_cookies()


@when('The user enters "{location}" in the search box')
def step_impl(context, location):
    page = MapsPage(context)
    page.input_search(location)


@when("Clicks on the search icon")
def step_impl(context):
    page = MapsPage(context)
    page.click_search_icon()


@when('Verify left panel has "{location}" as a headline text')
def step_impl(context, location):
    page = MapsPage(context)
    page.verify_panel_heading(location)


@when("Clicks on the directions icon")
def step_impl(context):
    page = MapsPage(context)
    page.click_directions_icon()


@then('Verify destination field is "{location}"')
def step_impl(context, location):
    page = MapsPage(context)
    page.verify_destination_field(location)
