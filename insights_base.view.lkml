include: "ad_transformations_base.view"
include: "stitch_base.view.lkml"

view: insights_base {
  extension: required
  extends: [stitch_base, ad_transformations_base]

  dimension: frequency {
    hidden: yes
    type: number
  }

  dimension: reach {
    hidden: yes
    type: number
  }

  dimension: spend {
    hidden: yes
    type: number
  }

  dimension: impressions {
    hidden: yes
    type: number
  }

  dimension: clicks {
    hidden: yes
    type: number
  }

  dimension: total_actions {
    hidden: yes
    type: number
  }

  dimension: total_action_value {
    hidden: yes
    type: number
  }

  dimension: account_id {
    hidden:  yes
    type: string
  }

  dimension: account_name {
    type: string
  }

  dimension: actions {
    hidden: yes
  }

  dimension: ad_id {
    hidden:  yes
    type: string
  }

  dimension: ad_name {
    type: string
  }

  dimension: adset_id {
    hidden:  yes
    type: string
  }

  dimension: adset_name {
    type: string
  }

  dimension: campaign_id {
    hidden:  yes
    type: string
  }

  dimension: campaign_name {
    type: string
  }

  dimension: canvas_avg_view_percent {
    hidden: yes
    type: number
  }

  dimension: canvas_avg_view_time {
    hidden: yes
    type: number
  }

  dimension: cost_per_inline_link_click {
    hidden: yes
    type: number
  }

  dimension: cost_per_inline_post_engagement {
    hidden: yes
    type: number
  }

  dimension: cost_per_total_action {
    hidden: yes
    type: number
  }

  dimension: cost_per_unique_click {
    hidden: yes
    type: number
  }

  dimension: cost_per_unique_inline_link_click {
    hidden: yes
    type: number
  }

  dimension: cpc {
    hidden: yes
    type: number
  }

  dimension: cpm {
    hidden: yes
    type: number
  }

  dimension: cpp {
    hidden: yes
    type: number
  }

  dimension: ctr {
    hidden: yes
    type: number
  }

  dimension: _date {
    hidden: yes
    type: date_raw
    sql: CAST(${TABLE}.date_start AS DATE) ;;
  }

  dimension_group: date_start {
    hidden: yes
    type: time
    label: "Start"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    allow_fill: no
  }

  dimension_group: date_stop {
    hidden:  yes
    label: "Stop"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: inline_link_click_ctr {
    hidden: yes
    type: number
  }

  dimension: inline_link_clicks {
    hidden: yes
    type: number
  }

  dimension: inline_post_engagement {
    hidden: yes
    type: number
  }

  dimension: objective {
    hidden: yes
    type: string
  }

  dimension: social_clicks {
    hidden: yes
    type: number
  }

  dimension: social_impressions {
    hidden: yes
    type: number
  }

  dimension: social_reach {
    hidden: yes
    type: number
  }

  dimension: total_unique_actions {
    hidden: yes
    type: number
  }

  dimension: unique_actions {
    hidden: yes
  }

  dimension: unique_clicks {
    hidden: yes
    type: number
  }

  dimension: unique_ctr {
    hidden: yes
    type: number
  }

  dimension: unique_inline_link_click_ctr {
    hidden: yes
    type: number
  }

  dimension: unique_inline_link_clicks {
    hidden: yes
    type: number
  }

  dimension: unique_link_clicks_ctr {
    hidden: yes
    type: number
  }

  dimension: unique_social_clicks {
    hidden: yes
    type: number
  }

  dimension: video_10_sec_watched_actions {
    hidden: yes
  }

  dimension: video_15_sec_watched_actions {
    hidden: yes
  }

  dimension: video_30_sec_watched_actions {
    hidden: yes
  }

  dimension: video_p100_watched_actions {
    hidden: yes
  }

  dimension: video_p25_watched_actions {
    hidden: yes
  }

  dimension: video_p50_watched_actions {
    hidden: yes
  }

  dimension: video_p75_watched_actions {
    hidden: yes
  }

  dimension: video_p95_watched_actions {
    hidden: yes
  }

  dimension: website_ctr {
    hidden: yes
  }
}

view: ads_insights__actions_website_base {
  extension: required
  dimension: action_destination {
    hidden: yes
    type: string
  }

  dimension: action_target_id {
    hidden: yes
    primary_key: yes
    type: string
  }

  dimension: action_type {
    hidden: yes
    type: string
  }

  dimension: value {
    hidden: yes
    type: number
  }

  dimension: offsite_conversion_value {
    hidden: yes
    type: number
    sql: CASE WHEN (${action_type} = 'offsite_conversion') THEN ${value} ELSE NULL END ;;
  }
}

view: ads_insights__actions_base {
  extends: [ads_insights__actions_website_base]
  extension: required
  dimension: _1d_click {
    hidden: yes
    type: number
  }

  dimension: _1d_view {
    hidden: yes
    type: number
  }

  dimension: _28d_click {
    hidden: yes
    type: number
  }

  dimension: _28d_view {
    hidden: yes
    type: number
  }

  dimension: _7d_click {
    hidden: yes
    type: number
  }

  dimension: _7d_view {
    hidden: yes
    type: number
  }
}

view: ads_insights__video_30_sec_watched_actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__video_p75_watched_actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__video_p95_watched_actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__website_ctr {
  extends: [ads_insights__actions_website_base]
}

view: ads_insights__video_15_sec_watched_actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__video_10_sec_watched_actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__unique_actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__video_p25_watched_actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__video_p100_watched_actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__video_p50_watched_actions {
  extends: [ads_insights__actions_base]
}

view: ads_insights__relevance_score {
  dimension: negative_feedback {
    hidden: yes
    type: string
  }

  dimension: positive_feedback {
    hidden: yes
    type: string
  }

  dimension: score {
    hidden: yes
    type: number
  }

  dimension: status {
    hidden: yes
    type: string
  }
}
