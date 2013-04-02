//
//  StacManUserMethods.h
//  StacMan
//
//  Created by Kevin Montrose on 4/1/13.
//  Copyright (c) 2013 Stack Exchange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StacManClient.h"
#import "StacManResponse.h"
#import "Utils.h"

@class StacManClient;
@interface StacManUserMethods : NSObject
-(id)initWithClient:(StacManClient*)client;

// getAll(String site, String filter, Integer page, Integer pageSize, Date fromDate, Date toDate, UserSort sort, Integer min, Integer max, Date minDate, Date maxDate, String minName, String maxName, Order order, String inName)
-(StacManResponse*)getAllOnSite:(NSString*)site filter:(NSString*)filer page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order inName:(NSString*)inName;

//getByIds(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, UserSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order)
-(StacManResponse*)getByIdsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order;

//getMe(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, UserSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order)
-(StacManResponse*)getMeOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order;

//getAnswers(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, AnswerSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getAnswersOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyAnswers(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, AnswerSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyAnswersOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getBadges(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, BadgeUserSort sort, BadgeRank minrank, BadgeRank maxrank, String minname, String maxname, BadgeType mintype, BadgeType maxtype, Date mindate, Date maxdate, Order order)
-(StacManResponse*)getBadgesOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyBadges(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, BadgeUserSort sort, BadgeRank minrank, BadgeRank maxrank, String minname, String maxname, BadgeType mintype, BadgeType maxtype, Date mindate, Date maxdate, Order order)
-(StacManResponse*)getMyBadgesOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort minRank:(NSString*)minRank maxRank:(NSString*)maxRank minName:(NSString*)minName maxName:(NSString*)maxName minType:(NSString*)minType maxType:(NSString*)maxType minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getComments(String site, Iterable<Integer> ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, CommentSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getCommentsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyComments(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, CommentSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyCommentsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getCommentsToUser(String site, Integer[] ids, int toid, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, CommentSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getCommentsToUserOnSite:(NSString*)site ids:(NSArray*)ids toId:(int)toId filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyCommentsToUser(String site, String access_token, int toid, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, CommentSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyCommentsToUserOnSite:(NSString*)site accessToken:(NSString*)accessToken toId:(int)toId filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getFavorites(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionFavoriteSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getFavoritesOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyFavorites(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionFavoriteSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyFavoritesOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getCommentsMentionedIn(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, CommentSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getCommentsMentionedInOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyCommentsMentionedIn(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, CommentSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyCommentsMentionedInOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getPrivileges(String site, int id, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getPrivilegesOnSite:(NSString*)site id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getMyPrivileges(String site, String access_token, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getMyPrivilegesOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getQuestions(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getQuestionsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyQuestions(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyQuestionsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getFeaturedQuestions(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getFeaturedQuestionsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyFeaturedQuestions(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyFeaturedQuestionsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getQuestionsWithNoAnswers(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getQuestionsWithNoAnswersOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyQuestionsWithNoAnswers(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyQuestionsWithNoAnswersOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getQuestionsWithUnaccepted(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getQuestionsWithUnacceptedOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyQuestionsWithUnaccepted(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyQuestionsWithUnacceptedOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getUnansweredQuestions(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getUnansweredQuestionsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getReputation(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate)
-(StacManResponse*)getReputationOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate;

//gtMyReputation(String site, String access_token, String filter)
-(StacManResponse*)getMyReputationOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate;

//getSuggestedEdits(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, SuggestedEditSort sort, Date mindate, Date maxdate, Order order)
-(StacManResponse*)getSuggestedEditsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMySuggestedEdits(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, SuggestedEditSort sort, Date mindate, Date maxdate, Order order)
-(StacManResponse*)getMySuggestedEditsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getTags(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, TagSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order)
-(StacManResponse*)getTagsOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order;

//getMyTags(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, TagSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order)
-(StacManResponse*)getMyTagsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSNumber*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order;

//getTopAnswers(String site, int id, String[] tags, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, AnswerSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order) {
-(StacManResponse*)getTopAnswersOnSite:(NSString*)site id:(int)_id tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyTopAnswers(String site, String access_token, String[] tags, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, AnswerSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order) {
-(StacManResponse*)getMyTopAnswersOnSite:(NSString*)site accessToken:(NSString*)accessToken tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getTopQuestions(String site, int id, String[] tags, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getTopQuestionsOnSite:(NSString*)site id:(int)_id tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getMyTopQuestions(String site, String access_token, String[] tags, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, QuestionSort sort, Date mindate, Date maxdate, Integer min, Integer max, Order order)
-(StacManResponse*)getMyTopQuestionsOnSite:(NSString*)site accessToken:(NSString*)accessToken tags:(NSArray*)tags filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate order:(NSString*)order;

//getTimelines(String site, Integer[] ids, String filter, Integer page, Integer pagesize, Date fromdate, Date todate)
-(StacManResponse*)getTimelinesOnSite:(NSString*)site ids:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate;

//getMyTimeline(String site, String access_token, String filter, Integer page, Integer pagesize, Date fromdate, Date todate)
-(StacManResponse*)getMyTimelinesOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate;

//getTopAnswerTags(String site, int id, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getTopAnswerTagsOnSite:(NSString*)site id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getMyTopAnswerTags(String site, String access_token, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getMyTopAnswerTagsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getTopQuestionTags(String site, int id, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getTopQuestionTagsOnSite:(NSString*)site id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getMyTopQuestionTags(String site, String access_token, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getMyTopQuestionTagsOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getModerators(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, UserSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order)
-(StacManResponse*)getModeratorsOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order;

//getElectedModerators(String site, String filter, Integer page, Integer pagesize, Date fromdate, Date todate, UserSort sort, Integer min, Integer max, Date mindate, Date maxdate, String minname, String maxname, Order order)
-(StacManResponse*)getElectedModeratorsOnSite:(NSString*)site filter:(NSString*)filter page:(int)page pageSize:(int)pageSize fromDate:(NSDate*)fromDate toDate:(NSDate*)toDate sort:(NSString*)sort min:(NSNumber*)min max:(NSString*)max minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate minName:(NSString*)minName maxName:(NSString*)maxName order:(NSString*)order;

//getInbox(String site, String access_token, int id, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getInboxOnSite:(NSString*)site accessToken:(NSString*)accessToken id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getMyInbox(String site, String access_token, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getMyInboxOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getInboxUnread(String site, String access_token, int id, String filter, Integer page, Integer pagesize, Date since)
-(StacManResponse*)getInboxUnreadOnSite:(NSString*)site accessToken:(NSString*)accessToken id:(int)_id filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getMyInboxUnread(String site, String access_token, String filter, Integer page, Integer pagesize, Date since)
-(StacManResponse*)getMyInboxUnreadOnSite:(NSString*)site accessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getAssociated(Integer[] ids, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getAssociatedWithAccountIds:(NSArray*)ids filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;

//getMyAssociated(String access_token, String filter, Integer page, Integer pagesize)
-(StacManResponse*)getMyAssociatedWithAccessToken:(NSString*)accessToken filter:(NSString*)filter page:(int)page pageSize:(int)pageSize;
@end
