<?php



/**
 * 
 **/

class Tag_Cloud_Decorator_HtmlTagWithoutLinks extends Zend_Tag_Cloud_Decorator_HtmlTag
{
    public function render(Zend_Tag_ItemList $tags)
    {
        if (null === ($weightValues = $this->getClassList())) {
            $weightValues = range($this->getMinFontSize(), $this->getMaxFontSize());
        }
        
        $tags->spreadWeightValues($weightValues);
        
        $result = array();
        
        foreach ($tags as $tag) {
            if (null === ($classList = $this->getClassList())) {
                $attribute = sprintf('style="font-size: %d%s;"', $tag->getParam('weightValue'), $this->getFontSizeUnit());
            } else {
                $attribute = sprintf('class="%s"', htmlspecialchars($tag->getParam('weightValue')));
            }
            
            foreach ($this->getHtmlTags() as $key => $data) {
                if (is_array($data)) {
                    $htmlTag    = $key;
                    $attributes = '';
                    
                    foreach ($data as $param => $value) {
                        $attributes .= ' ' . $param . '="' . htmlspecialchars($value) . '"';
                    }
                } else {
                    $htmlTag    = $data;
                    $attributes = '';
                }
                
                $tagHtml = sprintf('<%1$s%3$s>%2$s</%1$s>', $htmlTag, $tag->getTitle(), $attributes . ' ' . $attribute);
            }
            
            $result[] = $tagHtml;
        }
        
        return $result;

    }
}
