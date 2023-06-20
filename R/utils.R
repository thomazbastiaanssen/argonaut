#' Make dummy stratified data.
#' @description Make normal dummy stratified feature data.
#' @param nsubtypes An integer. How many subtypes
#' @param nfeatures An integer. How many features
#' @param nsamples An integer. How many samples
#' @param type A character vector. One ofc("seq", "by_subtype"). 
#' @param feature_names Default is NULL. Provide with a character vector of appropriate length to alter dummy names 
#' @param subtype_names Default is NULL. Provide with a character vector of appropriate length to alter dummy names
#' @param p_missing A proportion (0-1). Indicates the number of feature-subtype pairs should be dropped. 
#' @return A formatted data.frame.
#' @export
#'
dummy_strat <- function(nsubtypes, nfeatures, nsamples, type = "seq", feature_names = NULL, subtype_names = NULL, p_missing = 0.2){
  stopifnot("type must be `seq` or `by_subtype`." = type %in% c("seq", "by_subtype"))
  stopifnot("The argument `p_missing` is a proportion and should be between 0-1." = p_missing >= 0 & p_missing <= 1)
  
  if(is.null(feature_names)){feature_names = paste0("|feature_", formatC(1:nfeatures, digits = nchar(nfeatures), format = "d", flag = "0"))}
  if(is.null(subtype_names)){subtype_names = paste0("subtype_", formatC(1:nsubtypes, digits = nchar(nsubtypes), format = "d", flag = "0"))}
  
  
  row_names = paste0(rep(subtype_names, each = nfeatures), rep(paste0("|",feature_names)))
  
  if(type == "seq"){
    values =  matrix(data = 1:prod(nsubtypes, nfeatures, nsamples), ncol = nsamples)
  }
  if(type == "by_subtype"){
    basesubtype  = sample(1:1000, size = nsubtypes)
    subtypetable = floor(replicate(n = nsamples, expr = abs(rnorm(n = nsubtypes, mean = 1))) * basesubtype)
    values       = subtypetable[rep(1:nsubtypes, each = nfeatures),]
    values       = values * c(replicate(n = nsubtypes, sample(c(1:6), size = nfeatures, replace = T), simplify = T))
  }
  
  data.frame(row.names = row_names,  
    
    values

  )[sort(sample(1:(nsubtypes*nfeatures), size = floor((nsubtypes*nfeatures) * c(1-p_missing)))),]
  
}

#' Make an argonautica themed dummy stratified data.
#' @description Make an argonautica themed normal dummy stratified feature data.
#' @param nsubtypes An integer. How many heroes
#' @param nfeatures An integer. How many skills
#' @param nsamples An integer. How many argos
#' @param type A character vector. One ofc("seq", "by_subtype"). 
#' @param p_missing A proportion (0-1). Indicates the number of feature-subtype pairs should be dropped. 
#' @return An argonautica themed formatted data.frame.
#' @export
#'
board_argo <- function(nsubtypes = 96, nfeatures = 34, nsamples = 10, type = "by_subtype", p_missing = 0.2){
  dummy_strat(nsubtypes = nsubtypes, nfeatures = nfeatures, nsamples = nsamples, 
              type = type, p_missing = p_missing, 
              subtype_names = dummy_names(subject = "heroes", n = 96), 
              feature_names = dummy_names(subject = "feats", n = 34))
  }  

#' Provide dummy names data.
#' @description Make dummy names for dummy_strat
#' @param subject A character vector. Which theme to provide.
#' @param n An integer. how many names to provide.  
#' @return A character vector of names.
#'
dummy_names <- function(subject, n){
  if(subject == "heroes"){
    stopifnot("There were only 96 argonauts" = n <= 96)
    return(sample(x = c("Acastus", "Actor", "Admetus", "Aethalides", "Amphiaraus", 
             "Amphidamas", "Amphion", "Ancaeus", "Areius", "Argus", "Armenus", 
             "Ascalaphus", "Asclepius", "Asterion", "Asterius", "Atalanta", 
             "Augeas", "Autolycus", "Azorus", "Buphagus", "Butes", "Caeneus", 
             "Calais", "Canthus", "Castor", "Cepheus", "Cius", "Clymenus", 
             "Clytius", "Coronus", "Deucalion", "Echion", "Eneus", "Erginus", 
             "Eribotes", "Erytus", "Euphemus", "Euryalus", "Eurydamas", "Eurymedon", 
             "Eurytion", "Glaucus", "Heracles", "Hippalcimus", "Hylas", "Ialmenus", 
             "Idas", "Idmon", "Iolaus", "Iphiclus", "Iphis", "Iphitos", "Jason", 
             "Laertes", "Laocoon", "Leitus", "Leodocus", "Lynceus", "Melampus", 
             "Meleager", "Menoetius", "Mopsus", "Nauplius", "Neleus", "Nestor", 
             "Oileus", "Orpheus", "Palaemon", "Peleus", "Peneleos", "Periclymenus", 
             "Phalerus", "Phanus", "Philoctetes", "Phlias", "Phocus", "Pirithous", 
             "Poeas", "Pollux", "Polyphemus", "Priasus", "Staphylus", "Talaus", 
             "Telamon", "Thersanon", "Theseus", "Tiphys", "Tydeus", "Zetes", 
             "Cytissorus", "Melas", "Phrontis", "Demoleon", "Phlogius", "Phronius", 
             "Medea"), size = n))
    }
  if(subject == "feats"){
    stopifnot("We only have 34 heroic skills" = n <= 34)
    return(sample(x = c("Archery", "Swordfighting", "Navigation", "History", 
                 "Strategy", "Physics", "Biology", "Chemistry", "Geography", 
                 "Mathematics", "Philosophy","Music", "Oration", "Debate", 
                 "Natural history", "Literature", "Sprinting", "Running", 
                 "Jumping", "Discus throwing", "Cooking", "Hunting", "Stealth", 
                 "Trickery", "Metalcraft", "Woodcraft", "Painting", "Fishing", 
                 "Wrestling", "Leadership", "Spirituality", "Theatre", 
                 "Disguise", "Basketweaving"), size = n))
    }
}

