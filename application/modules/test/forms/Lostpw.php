<?php

class Test_Form_Lostpw extends Zend_Form
{
    public function init()
    {
        /*
         * <form class="form" id="password-recovery" method="post" action="" autocomplete="off" >
			    <input type="hidden" name="recovery" value="recovery" />
			    <input type="hidden" name="hashrecovery" value="" />
				<fieldset class="grey-bg no-margin collapse">
					<legend><a href="#">Lost password?</a></legend>
					<p class="input-with-button">
						<label for="recovery-mail">Enter your e-mail addresssss</label>
						<input type="text" name="recoverymail" id="recoverymail" value="">
						<button type="submit">Send</button>
					</p>
				</fieldset>
			</form>
         */
        
        $this->setMethod('POST')
        ->setAttrib('autocomplete','off')
        ->setAttrib('id','password-recovery');
        
        $recovery = new Zend_Form_Element_Hidden('recovery');
        $recovery->setValue('recovery');
         
        $hash = new Zend_Form_Element_Hidden('hashrecovery');
        
        $email = new Zend_Form_Element_Text('recoverymail');
        $email->setLabel('Enter your e-mail adress');
        
        $button = new Zend_Form_Element_Button('Send');
        $button->setAttrib('type','submit');
        
        $this->addElements(array(
                $recovery,
                $hash,
                $email,
                $button
                ));
        
        $this->clearDecorators();
        
        $this->addDecorator('FormElements')
        ->addDecorator('Form');
        
        $this->setElementDecorators(array(
        		array('ViewHelper'),
        		array('Errors'),
        		array('Description'),
        		array('Label'),
        		array('HtmlTag',array('tag'=>'p','class'=>'input-with-button'))
        ));
        
        $recovery->setDecorators(array(
        		array('ViewHelper')
        ));
        $hash->setDecorators(array(
        		array('ViewHelper')
        ));
        
        $button->setDecorators(array(
        		array('ViewHelper')
        ));
        
        $this->addDisplayGroup(array(
                $email,
                $button
                ),'name',
                array(
                        'legend' => '<a href="#">Lost password?</a>',
                        'escape' => false,
                        'name' => 'lostpw',
                        'class' => 'grey-bg no-margin collapse',
                        'decorators' => array(
                                'FormElements',
                                'Fieldset'
                        )));
    }
}