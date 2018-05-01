@soundcloud
Feature: SoundCloud Shortcode Feature

  Scenario: The SoundCloud tip displays correctly.
    Given I am logged in as a user with the "edit_only" role
    When I go to "filter/tips"
    Then I should see "[soundcloud width=\"100%\" height=\"450\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/ID_GOES_HERE&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&visual=true\"][/soundcloud]"

  @javascript
  Scenario: The SoundCloud embed appears once added to a page.
    Given I am logged in as a user with the "edit_only" role
      And I go to "node/add/page"
      And I fill in "Title" with "SoundCloud Page"
      And I wait for the "#cke_1_top" element to appear
      And I press "Soundcloud Shortcode Generator"
      And I wait for the ".cke_dialog_contents_body" element to appear
    When I fill in "Soundcloud Embed Code" with "[soundcloud id=\"testing-soundcloud\" width=\"100%\" height=\"300\" scrolling=\"no\" frameborder=\"no\" allow=\"autoplay\" src=\"https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/435808485&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true\"][/soundcloud]"
      And I press "OK"
      And I press "Save"
      And I wait for the "#testing-soundcloud" element to appear
    When I switch to the iframe "testing-soundcloud"
    Then I should see "Zesty Surprise"
      And I should see "Cookie policy"
