//
//  Constants.m
//  StacMan
//
//  Created by Kevin Montrose on 3/29/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import "StacManConstants.h"

NSString *const StacManActivityAnswerSort = @"activity";
NSString *const StacManCreationAnswerSort = @"creation";
NSString *const StacManVotesAnswerSort = @"votes";

NSString *const StacManRankBadgeAllSort = @"rank";
NSString *const StacManNameBadgeAllSort = @"name";
NSString *const StacManTypeBadgeAllSort = @"type";

NSString *const StacManGoldBadgeRank = @"gold";
NSString *const StacManSilverBadgeRank = @"silver";
NSString *const StacManBronzeBadgeRank = @"bronze";

NSString *const StacManRankBadgeSort = @"rank";
NSString *const StacManNameBadgeSort = @"name";

NSString *const StacManNamedBadgeType = @"named";
NSString *const StacManTagBasedBadgeType = @"tag_based";

NSString *const StacManRankBadgeUserSort = @"rank";
NSString *const StacManNameBadgeUserSort = @"name";
NSString *const StacManTypeBadgeUserSort = @"type";
NSString *const StacManAwardedBadgeUserSort = @"awarded";

NSString *const StacManCreationCommentSort = @"creation";
NSString *const StacManVotesCommentSort = @"votes";

NSString *const StacManQuestionPostedEventType = @"question_posted";
NSString *const StacManAnswerPostedEventType = @"answer_posted";
NSString *const StacManCommentPostedEventType = @"comment_posted";
NSString *const StacManPostEditedEventType = @"post_edited";
NSString *const StacManUserCreatedEventType = @"user_created";

NSString *const StacManSafeFilterType = @"safe";
NSString *const StacManUnsafeFilterType = @"unsafe";
NSString *const StacManInvalidFilterType = @"invalid";

NSString *const StacManCommentInboxItemType = @"comment";
NSString *const StacManChatMessageInboxItemType = @"chat_message";
NSString *const StacManNewAnswerInboxItemType = @"new_answer";
NSString *const StacManCareersMessageInboxItemType = @"careers_message";
NSString *const StacManCareersInvitationInboxItemType = @"careers_invitation";
NSString *const StacManMetaQuestionInboxItemType = @"meta_question";
NSString *const StacManPostNoticeInboxItemType = @"post_notice";
NSString *const StacManModeratorMessageInboxItemType = @"moderator_message";

NSString *const StacManDescendingOrder = @"desc";
NSString *const StacManAscendingOrder = @"asc";

NSString *const StacManActivityPostSort = @"activity";
NSString *const StacManCreationPostSort = @"creation";
NSString *const StacManVotesPostSort = @"votes";

NSString *const StacManQuestionPostType = @"question";
NSString *const StacManAnswerPostType = @"answer";

NSString *const StacManActivityQuestionAllSort = @"activity";
NSString *const StacManVotesQuestionAllSort = @"votes";
NSString *const StacManCreationQuestionAllSort = @"creation";
NSString *const StacManHotQuestionAllSort = @"hot";
NSString *const StacManWeekQuestionAllSort = @"week";
NSString *const StacManMonthQuestionAllSort = @"month";

NSString *const StacManActivityQuestionFavoriteSort = @"activity";
NSString *const StacManCreationQuestionFavoriteSort = @"creation";
NSString *const StacManVotesQuestionFavoriteSort = @"votes";
NSString *const StacManAddedQuestionFavoriteSort = @"added";

NSString *const StacManActivityQuestionRelatedSort = @"activity";
NSString *const StacManCreationQuestionRelatedSort = @"creation";
NSString *const StacManVotesQuestionRelatedSort = @"votes";
NSString *const StacManRankQuestionRelatedSort = @"rank";

NSString *const StacManActivityQuestionSearchSort = @"activity";
NSString *const StacManCreationQuestionSearchSort = @"creation";
NSString *const StacManVotesQuestionSearchSort = @"votes";
NSString *const StacManRelevanceQuestionSearchSort = @"relevance";

NSString *const StacManActivityQuestionSort = @"activity";
NSString *const StacManCreationQuestionSort = @"creation";
NSString *const StacManVotesQuestionSort = @"votes";

NSString *const StacManQuestionQuestionTimelineType = @"question";
NSString *const StacManAnswerQuestionTimelineType = @"answer";
NSString *const StacManCommentQuestionTimelineType = @"comment";
NSString *const StacManUnacceptedAnswerQuestionTimelineType = @"unaccepted_answer";
NSString *const StacManAcceptedAnswerQuestionTimelineType = @"accepted_answer";
NSString *const StacManVoteAggregateQuestionTimelineType = @"vote_aggregate";
NSString *const StacManRevisionQuestionTimelineType = @"revision";
NSString *const StacManPostStateChangedQuestionTimelineType = @"post_state_changed";

NSString *const StacManSingleUserRevisionType = @"single_user";
NSString *const StacManVoteBasedRevisionType = @"vote_based";

NSString *const StacManNormalSiteState = @"normal";
NSString *const StacManClosedBetaSiteState = @"closed_beta";
NSString *const StacManOpenBetaSiteState = @"open_beta";
NSString *const StacManLinkedMetaSiteState = @"linked_meta";

NSString *const StacManCreationSuggestedEditSort = @"creation";
NSString *const StacManApprovalSuggestedEditSort = @"approval";
NSString *const StacManRejectionSuggestedEditSort = @"rejection";

NSString *const StacManAllTimeTagPeriod = @"all_time";
NSString *const StacManMonthTagPeriod = @"month";

NSString *const StacManCreationTagSynonymSort = @"creation";
NSString *const StacManAppliedTagSynonymSort = @"applied";
NSString *const StacManActivityTagSynonymSort = @"activity";

NSString *const StacManReputationUserSort = @"reputation";
NSString *const StacManCreationUserSort = @"creation";
NSString *const StacManNameUserSort = @"name";
NSString *const StacManModifiedUserSort = @"modified";

NSString *const StacManCommentedUserTimelineType = @"commented";
NSString *const StacManAskedUserTimelineType = @"asked";
NSString *const StacManAnsweredUserTimelineType = @"answered";
NSString *const StacManBadgeUserTimelineType = @"badge";
NSString *const StacManRevisionUserTimelineType = @"revision";
NSString *const StacManAcceptedUserTimelineType = @"accepted";
NSString *const StacManReviewedUserTimelineType = @"reviewed";
NSString *const StacManSuggestedUserTimelineType = @"suggested";

NSString* const StacManUnregisteredUserType = @"unregistered";
NSString *const StacManRegisteredUserType = @"registered";
NSString *const StacManModeratorUserType = @"moderator";
NSString *const StacManDoesNotExistUserType = @"does_not_exist";

NSString *const StacManAcceptsVoteType = @"accepts";
NSString *const StacManUpVotesVoteType = @"up_votes";
NSString *const StacManDownVotesVoteType = @"down_votes";
NSString *const StacManBountiesOfferedVoteType = @"bounties_offered";
NSString *const StacManBountiesWonVoteType = @"bounties_won";
NSString *const StacManSpamVoteType = @"spam";
NSString *const StacManSuggestedEditsVoteType = @"suggested_edits";