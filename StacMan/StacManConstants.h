//
//  Constants.h
//  StacMan
//
//  Created by Kevin Montrose on 3/29/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>

// Answer sorts
FOUNDATION_EXPORT NSString *const StacManActivityAnswerSort;
FOUNDATION_EXPORT NSString *const StacManCreationAnswerSort;
FOUNDATION_EXPORT NSString *const StacManVotesAnswerSort;

// Badge All sorts
FOUNDATION_EXPORT NSString *const StacManRankBadgeAllSort;
FOUNDATION_EXPORT NSString *const StacManNameBadgeAllSort;
FOUNDATION_EXPORT NSString *const StacManTypeBadgeAllSort;

// Badge ranks
FOUNDATION_EXPORT NSString *const StacManGoldBadgeRank;
FOUNDATION_EXPORT NSString *const StacManSilverBadgeRank;
FOUNDATION_EXPORT NSString *const StacManBronzeBadgeRank;

// Badge sorts
FOUNDATION_EXPORT NSString *const StacManRankBadgeSort;
FOUNDATION_EXPORT NSString *const StacManNameBadgeSort;

// Badge types
FOUNDATION_EXPORT NSString *const StacManNamedBadgeType;
FOUNDATION_EXPORT NSString *const StacManTagBasedBadgeType;

// Badge User sorts
FOUNDATION_EXPORT NSString *const StacManRankBadgeUserSort;
FOUNDATION_EXPORT NSString *const StacManNameBadgeUserSort;
FOUNDATION_EXPORT NSString *const StacManTypeBadgeUserSort;
FOUNDATION_EXPORT NSString *const StacManAwardedBadgeUserSort;

// Comment sorts
FOUNDATION_EXPORT NSString *const StacManCreationCommentSort;
FOUNDATION_EXPORT NSString *const StacManVotesCommentSort;

// Event types
FOUNDATION_EXPORT NSString *const StacManQuestionPostedEventType;
FOUNDATION_EXPORT NSString *const StacManAnswerPostedEventType;
FOUNDATION_EXPORT NSString *const StacManCommentPostedEventType;
FOUNDATION_EXPORT NSString *const StacManPostEditedEventType;
FOUNDATION_EXPORT NSString *const StacManUserCreatedEventType;

// Filter types
FOUNDATION_EXPORT NSString *const StacManSafeFilterType;
FOUNDATION_EXPORT NSString *const StacManUnsafeFilterType;
FOUNDATION_EXPORT NSString *const StacManInvalidFilterType;

// InboxItem types
FOUNDATION_EXPORT NSString *const StacManCommentInboxItemType;
FOUNDATION_EXPORT NSString *const StacManChatMessageInboxItemType;
FOUNDATION_EXPORT NSString *const StacManNewAnswerInboxItemType;
FOUNDATION_EXPORT NSString *const StacManCareersMessageInboxItemType;
FOUNDATION_EXPORT NSString *const StacManCareersInvitationInboxItemType;
FOUNDATION_EXPORT NSString *const StacManMetaQuestionInboxItemType;
FOUNDATION_EXPORT NSString *const StacManPostNoticeInboxItemType;
FOUNDATION_EXPORT NSString *const StacManModeratorMessageInboxItemType;

// Orders
FOUNDATION_EXPORT NSString *const StacManDescendingOrder;
FOUNDATION_EXPORT NSString *const StacManAscendingOrder;

// Post sorts
FOUNDATION_EXPORT NSString *const StacManActivityPostSort;
FOUNDATION_EXPORT NSString *const StacManCreationPostSort;
FOUNDATION_EXPORT NSString *const StacManVotesPostSort;

// Post types
FOUNDATION_EXPORT NSString *const StacManQuestionPostType;
FOUNDATION_EXPORT NSString *const StacManAnswerPostType;

// Question All sorts
FOUNDATION_EXPORT NSString *const StacManActivityQuestionAllSort;
FOUNDATION_EXPORT NSString *const StacManVotesQuestionAllSort;
FOUNDATION_EXPORT NSString *const StacManCreationQuestionAllSort;
FOUNDATION_EXPORT NSString *const StacManHotQuestionAllSort;
FOUNDATION_EXPORT NSString *const StacManWeekQuestionAllSort;
FOUNDATION_EXPORT NSString *const StacManMonthQuestionAllSort;

// Question Favorite sorts
FOUNDATION_EXPORT NSString *const StacManActivityQuestionFavoriteSort;
FOUNDATION_EXPORT NSString *const StacManCreationQuestionFavoriteSort;
FOUNDATION_EXPORT NSString *const StacManVotesQuestionFavoriteSort;
FOUNDATION_EXPORT NSString *const StacManAddedQuestionFavoriteSort;

// Question Related sorts
FOUNDATION_EXPORT NSString *const StacManActivityQuestionRelatedSort;
FOUNDATION_EXPORT NSString *const StacManCreationQuestionRelatedSort;
FOUNDATION_EXPORT NSString *const StacManVotesQuestionRelatedSort;
FOUNDATION_EXPORT NSString *const StacManRankQuestionRelatedSort;

// Question Search sorts
FOUNDATION_EXPORT NSString *const StacManActivityQuestionSearchSort;
FOUNDATION_EXPORT NSString *const StacManCreationQuestionSearchSort;
FOUNDATION_EXPORT NSString *const StacManVotesQuestionSearchSort;
FOUNDATION_EXPORT NSString *const StacManRelevanceQuestionSearchSort;

// Question sorts
FOUNDATION_EXPORT NSString *const StacManActivityQuestionSort;
FOUNDATION_EXPORT NSString *const StacManCreationQuestionSort;
FOUNDATION_EXPORT NSString *const StacManVotesQuestionSort;

// QuestionTimeline types
FOUNDATION_EXPORT NSString *const StacManQuestionQuestionTimelineType;
FOUNDATION_EXPORT NSString *const StacManAnswerQuestionTimelineType;
FOUNDATION_EXPORT NSString *const StacManCommentQuestionTimelineType;
FOUNDATION_EXPORT NSString *const StacManUnacceptedAnswerQuestionTimelineType;
FOUNDATION_EXPORT NSString *const StacManAcceptedAnswerQuestionTimelineType;
FOUNDATION_EXPORT NSString *const StacManVoteAggregateQuestionTimelineType;
FOUNDATION_EXPORT NSString *const StacManRevisionQuestionTimelineType;
FOUNDATION_EXPORT NSString *const StacManPostStateChangedQuestionTimelineType;

// Revision types
FOUNDATION_EXPORT NSString *const StacManSingleUserRevisionType;
FOUNDATION_EXPORT NSString *const StacManVoteBasedRevisionType;

// Site states
FOUNDATION_EXPORT NSString *const StacManNormalSiteState;
FOUNDATION_EXPORT NSString *const StacManClosedBetaSiteState;
FOUNDATION_EXPORT NSString *const StacManOpenBetaSiteState;
FOUNDATION_EXPORT NSString *const StacManLinkedMetaSiteState;

// SuggestedEdit sorts
FOUNDATION_EXPORT NSString *const StacManCreationSuggestedEditSort;
FOUNDATION_EXPORT NSString *const StacManApprovalSuggestedEditSort;
FOUNDATION_EXPORT NSString *const StacManRejectionSuggestedEditSort;

// Tag periods
FOUNDATION_EXPORT NSString *const StacManAllTimeTagPeriod;
FOUNDATION_EXPORT NSString *const StacManMonthTagPeriod;

// TagSynonym sorts
FOUNDATION_EXPORT NSString *const StacManCreationTagSynonymSort;
FOUNDATION_EXPORT NSString *const StacManAppliedTagSynonymSort;
FOUNDATION_EXPORT NSString *const StacManActivityTagSynonymSort;

// User sorts
FOUNDATION_EXPORT NSString *const StacManReputationUserSort;
FOUNDATION_EXPORT NSString *const StacManCreationUserSort;
FOUNDATION_EXPORT NSString *const StacManNameUserSort;
FOUNDATION_EXPORT NSString *const StacManModifiedUserSort;

// UserTimline types
FOUNDATION_EXPORT NSString *const StacManCommentedUserTimelineType;
FOUNDATION_EXPORT NSString *const StacManAskedUserTimelineType;
FOUNDATION_EXPORT NSString *const StacManAnsweredUserTimelineType;
FOUNDATION_EXPORT NSString *const StacManBadgeUserTimelineType;
FOUNDATION_EXPORT NSString *const StacManRevisionUserTimelineType;
FOUNDATION_EXPORT NSString *const StacManAcceptedUserTimelineType;
FOUNDATION_EXPORT NSString *const StacManReviewedUserTimelineType;
FOUNDATION_EXPORT NSString *const StacManSuggestedUserTimelineType;

// User types
FOUNDATION_EXPORT NSString *const StacManUnregisteredUserType;
FOUNDATION_EXPORT NSString *const StacManRegisteredUserType;
FOUNDATION_EXPORT NSString *const StacManModeratorUserType;
FOUNDATION_EXPORT NSString *const StacManDoesNotExistUserType;

// Vote types
FOUNDATION_EXPORT NSString *const StacManAcceptsVoteType;
FOUNDATION_EXPORT NSString *const StacManUpVotesVoteType;
FOUNDATION_EXPORT NSString *const StacManDownVotesVoteType;
FOUNDATION_EXPORT NSString *const StacManBountiesOfferedVoteType;
FOUNDATION_EXPORT NSString *const StacManBountiesWonVoteType;
FOUNDATION_EXPORT NSString *const StacManSpamVoteType;
FOUNDATION_EXPORT NSString *const StacManSuggestedEditsVoteType;